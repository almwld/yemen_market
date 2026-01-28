#!/usr/bin/env bash
echo "🔎 EFO: Home ↔ Products check"

grep -R "HomePage" lib/features/home || exit 1
grep -R "ProductsGrid" lib/features || exit 1
grep -R "BlocBuilder<ProductsCubit" lib/ || exit 1

echo "✅ EFO OK: Home مربوط بالمنتجات 100%"
