#!/data/data/com.termux/files/usr/bin/bash

echo "🎮 تحكم في Codespace من Termux"

CODESPACE="yemen-market-wrr5rwv6jrj4f5pqp"

while true; do
    echo ""
    echo "🔧 اختر الإجراء:"
    echo "1. الاتصال عبر SSH"
    echo "2. تنفيذ أمر واحد"
    echo "3. إيقاف Codespace"
    echo "4. إعادة تشغيل"
    echo "5. عرض الحالة"
    echo "6. عرض Logs"
    echo "7. نسخ ملف إلى Codespace"
    echo "8. نسخ ملف من Codespace"
    echo "9. فتح في المتصوبع"
    echo "0. الخروج"
    
    read -p "اختيارك (0-9): " choice
    
    case $choice in
        1)
            echo "🖥️ الاتصال إلى $CODESPACE..."
            gh codespace ssh -c $CODESPACE
            ;;
        2)
            read -p "أدخل الأمر (مثال: pwd && ls): " cmd
            gh codespace ssh -c $CODESPACE --command "$cmd"
            ;;
        3)
            echo "⏸️ إيقاف $CODESPACE..."
            gh codespace stop -c $CODESPACE
            ;;
        4)
            echo "🔄 إعادة تشغيل $CODESPACE..."
            gh codespace restart -c $CODESPACE
            ;;
        5)
            echo "📊 حالة $CODESPACE:"
            gh codespace view -c $CODESPACE
            ;;
        6)
            echo "📝 Logs الـ $CODESPACE:"
            gh codespace logs -c $CODESPACE
            ;;
        7)
            read -p "المحلي (من Termux): " local_file
            read -p "الوجهة (في Codespace): " remote_path
            gh codespace cp -c $CODESPACE "$local_file:$remote_path"
            ;;
        8)
            read -p "الملف في Codespace: " remote_file
            read -p "الوجهة في Termux: " local_path
            gh codespace cp -c $CODESPACE "$remote_file:$local_path"
            ;;
        9)
            echo "🌐 فتح في المتصوبع..."
            gh codespace code -c $CODESPACE
            ;;
        0)
            echo "👋 مع السلامة"
            exit 0
            ;;
        *)
            echo "❌ اختيار غير صحيح"
            ;;
    esac
done
