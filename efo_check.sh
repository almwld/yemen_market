#!/usr/bin/env bash
echo "🔎 EFO: Products Feature Check"

grep -R "ProductsCubit" lib/ || exit 1
grep -R "ProductsLoaded" lib/ || exit 1
grep -R "BlocBuilder<ProductsCubit" lib/ || exit 1

echo "✅ EFO OK: Products feature مترابط بالكامل"
