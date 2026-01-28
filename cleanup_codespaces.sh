#!/data/data/com.termux/files/usr/bin/bash

echo "🧹 تنظيف وإدارة Codespaces..."

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# التحقق من تسجيل الدخول
if ! gh auth status &> /dev/null; then
    echo -e "${RED}❌ غير مسجل الدخول إلى GitHub${NC}"
    gh auth login
fi

while true; do
    echo ""
    echo "🎯 اختر الإجراء:"
    echo "1. عرض جميع Codespaces"
    echo "2. حذف Codespace محدد"
    echo "3. حذف جميع Codespaces"
    echo "4. حذف Codespaces القديمة (أكثر من يوم)"
    echo "5. إيقاف جميع Codespaces"
    echo "6. عرض استخدام Codespace"
    echo "7. الخروج"
    
    read -p "اختيارك (1-7): " choice
    
    case $choice in
        1)
            echo -e "${GREEN}📋 Codespaces الحالية:${NC}"
            gh codespace list --json name,displayName,state,createdAt,gitStatus | jq -r '.[] | "• \(.name): \(.displayName) (\(.state)) - \(.createdAt) - \(.gitStatus.repo)"'
            ;;
        2)
            echo -e "${YELLOW}🗑️ حذف Codespace محدد${NC}"
            echo "أدخل اسم Codespace:"
            gh codespace list --json name,displayName | jq -r '.[] | "  \(.name): \(.displayName)"'
            read -p "الاسم: " cs_name
            if [ -n "$cs_name" ]; then
                gh codespace delete -c "$cs_name"
                echo -e "${GREEN}✅ تم حذف $cs_name${NC}"
            fi
            ;;
        3)
            echo -e "${RED}⚠️ حذف جميع Codespaces${NC}"
            read -p "هل أنت متأكد؟ (نعم/لا): " confirm
            if [[ $confirm == "نعم" || $confirm == "yes" || $confirm == "y" ]]; then
                gh codespace delete --all
                echo -e "${GREEN}✅ تم حذف جميع Codespaces${NC}"
            else
                echo "❌ تم الإلغاء"
            fi
            ;;
        4)
            echo -e "${YELLOW}🧹 حذف القديمة فقط${NC}"
            # حذف أقدم من يوم
            OLD_CODESPACES=$(gh codespace list --json name,createdAt | jq -r '.[] | select(.createdAt < "'$(date -d "1 day ago" -Iseconds)'") | .name')
            
            if [ -z "$OLD_CODESPACES" ]; then
                echo "✅ لا توجد codespaces قديمة"
            else
                echo "سيتم حذف:"
                echo "$OLD_CODESPACES"
                read -p "متابعة؟ (نعم/لا): " confirm
                if [[ $confirm == "نعم" || $confirm == "yes" || $confirm == "y" ]]; then
                    echo "$OLD_CODESPACES" | xargs -I {} gh codespace delete -c {}
                    echo -e "${GREEN}✅ تم الحذف${NC}"
                fi
            fi
            ;;
        5)
            echo -e "${YELLOW}⏸️ إيقاف جميع Codespaces${NC}"
            gh codespace list --json name | jq -r '.[].name' | while read cs; do
                echo "إيقاف $cs..."
                gh codespace stop -c "$cs"
            done
            echo -e "${GREEN}✅ تم إيقاف الجميع${NC}"
            ;;
        6)
            echo -e "${GREEN}📊 استخدام Codespace:${NC}"
            gh api /user/codespaces/quota | jq '.'
            ;;
        7)
            echo "👋 مع السلامة"
            exit 0
            ;;
        *)
            echo "❌ اختيار غير صحيح"
            ;;
    esac
done
