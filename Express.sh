#!/bin/bash

alias Express='./Express.sh'
#subCommand cases 
case "$1" in
    -f|--file)
    #insert file name
    FILE="$2"
        case "$3" in 
            -e|--Encrypt)
            #set key file to be read
            KEY="$4"
            #if file exists encrypt else print error
            if [ -e "$FILE" ]; then 
                #encrypts using 64 bit key and using AES
                openssl enc -aes-256-cbc -salt -in "$FILE" -out "encrypted_file.enc" -pass "pass:$KEY"
            else
                #Error print
                echo "ERROR ENCRYPTING"
            fi
            ;;
            -d|--decrypt)
            #set key to be read
            KEY="$4"
            #decrypt file else print error
            if [ -e "$FILE" ]; then 
                openssl enc -d -aes-256-cbc -salt -in "$FILE" -out "decrypted_file.txt" -pass "pass:$KEY"
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
    FILE="$2"
        case "$3" in 
            -h|--host)
            HOST="$4"
                case "$5" in
                    -u|--username)
                    USER="$6"
                    PASSWD="$7"
                        case "$8" in
                            -l|-location)
                            DIRECTORY="$9"
                            chmod +x send.sh
                            ./send.sh
                        ;;
                        esac
                ;;
                esac
        ;;
        esac
    ;;
    -r|--recieve)
        FILE="$2"
        case "$3" in 
            -h|--host)
            HOST="$4"
                case "$5" in
                    -u|--username)
                    USER="$6"
                    PASSWD="$7"
                        case "$8" in
                            -l|-location)
                            DIRECTORY="$9"
                            chmod +x recieve.sh
                            ./recieve.sh
                        ;;
                        esac
                ;;
                esac
        ;;
        esac
    ;;
esac