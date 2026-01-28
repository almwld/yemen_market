const admin = require('firebase-admin');

async function sendNotification(token, title, body, data = {}) {
  if (!token) return;

  const message = {
    token,
    notification: {
      title,
      body,
    },
    data,
  };

  await admin.messaging().send(message);
}

async function notifySellerOrder(sellerToken, orderId) {
  await sendNotification(
    sellerToken,
    'طلب جديد',
    'لديك طلب شراء جديد',
    { orderId }
  );
}

async function notifyPaymentDone(token, orderId) {
  await sendNotification(
    token,
    'تم الدفع',
    'تم استلام الدفع بنجاح',
    { orderId }
  );
}

async function notifyAdminNewSeller(adminToken, sellerName) {
  await sendNotification(
    adminToken,
    'تاجر جديد',
    `تم تسجيل تاجر جديد: ${sellerName}`
  );
}

module.exports = {
  notifySellerOrder,
  notifyPaymentDone,
  notifyAdminNewSeller,
};
