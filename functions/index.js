const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();

const { calculateCommission } = require('./services/commission');
const { updateWallet } = require('./services/wallet');
const { updateReport } = require('./services/reports');

exports.onOrderPaid = functions.firestore
  .document('orders/{orderId}')
  .onUpdate(async (change, context) => {

    const before = change.before.data();
    const after = change.after.data();

    // تنفيذ مرة واحدة فقط
    if (before.status === 'paid' || after.status !== 'paid') {
      return null;
    }

    const total = after.total;
    const sellerId = after.sellerId;

    const commission = calculateCommission(total);
    const sellerNet = total - commission;

    // تحديث الطلب
    await change.after.ref.update({
      commission,
      sellerNet,
    });

    // تحديث المحفظة
    await updateWallet(db, sellerId, sellerNet);

    // تحديث التقارير
    await updateReport(db, sellerId, total, commission);

    return null;
  });
