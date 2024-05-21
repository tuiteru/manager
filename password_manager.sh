#!/bin/bash

#ファイルの保存
PASSWORD_FILE="passwords.txt"

# Exitまで繰り返し
while true; do
    # ユーザー選択
    echo "パスワードマネージャーへようこそ！"
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" choice

    # 文字列のパターンにマッチするか判定
    case $choice in
        "Add Password")
            # サービス名を変数に格納
            read -p "サービス名を入力してください：" service_name
            # ユーザー名を変数に格納
            read -p "ユーザー名を入力してください：" user_name
            # パスワードを変数に格納
            read -p "パスワードを入力してください：" password
            echo

            # 変数をファイルに保存
            echo "$service_name:$user_name:$password" >> $PASSWORD_FILE
            # 完了
            echo "パスワードの追加は成功しました。"
            ;;

        "Get Password")
            # ユーザー入力
            read -p "サービス名を入力してください：" service_name

            # 入力を検索
            result=$(grep "^$service_name:" $PASSWORD_FILE)

            # 登録されていない場合
            if [ -z "$result" ]; then
                echo "そのサービスは登録されていません。"
            else
                # 結果を表示
                IFS=':' read -r svc user pass <<< "$result"
                echo "サービス名：$svc"
                echo "ユーザー名：$user"
                echo "パスワード：$pass"
            fi
            ;;

        "Exit")
            # 終わりの挨拶
            echo "Thank you!"
            break
            ;;

        *)
            # 入力違い
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac

    echo

done








