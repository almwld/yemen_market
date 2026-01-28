const admin = require('firebase-admin');

async function updateReport(db, sellerId, total, commission) {
  const ref = db.collection('reports').doc(sellerId);

  await ref.set({
    totalSales: admin.firestore.FieldValue.increment(total),
    totalCommission: admin.firestore.FieldValue.increment(commission),
    netProfit: admin.firestore.FieldValue.increment(total - commission),
  }, { merge: true });
}

module.exports = {
  updateReport,
};
