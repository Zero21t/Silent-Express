#!/bin/bash

alias Express='./Express.sh'
#subCommand cases 
case "$1" in
    -f|--file)
    #insert file name
    file="$2"
        case "$3" in 
            -e|--Encrypt)
            #set key file to be read
            Key="$4"
            #if file exists encrypt else print error
            if [ -e "$file" ]; then 
                #encrypts using 64 bit key and using AES
                openssl enc -aes-256-cbc -salt -in "$file" -out "encrypted_file.enc" -pass "pass:$Key"
            else
                #Error print
                echo "ERROR ENCRYPTING"
            fi
            ;;
            -d|--decrypt)
            #set key to be read
            Key="$4"
            #decrypt file else print error
            if [ -e "$file" ]; then 
                openssl enc -d -aes-256-cbc -salt -in "$file" -out "decrypted_file.txt" -pass "pass:$Key"
            else 
            #Error print
                echo "ERROR DECRYPTING"
            fi
            ;;
        esac
    ;;
    -k|--key)
        #Creates a file with a 64 bit key
        Encryption_Key=$(openssl rand -hex 64)
        touch "Key.txt"
        #inserts key into a file
        echo "$Encryption_Key" >> "Key.txt"
        echo "Key.txt:"
    ;;
    -s|--send)
    file="$2"
        case "$3" in 
            -ip)
            IP="$4"
                case "$5" in
                    -p)
                    port="$6"
                    chmod +x upload.sh
                    ./upload.sh
                    ;;
                esac
            ;;
        esac
    ;;
    *)
        echo "invalid command"
        ;;
esac