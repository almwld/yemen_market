async function updateWallet(db, sellerId, sellerNet) {
  const walletRef = db.collection('wallets').doc(sellerId);

  await db.runTransaction(async (tx) => {
    const snap = await tx.get(walletRef);

    if (!snap.exists) {
      tx.set(walletRef, {
        balance: sellerNet,
        totalEarned: sellerNet,
        pending: 0,
      });
    } else {
      tx.update(walletRef, {
        balance: snap.data().balance + sellerNet,
        totalEarned: snap.data().totalEarned + sellerNet,
      });
    }
  });
}

module.exports = {
  updateWallet,
};
