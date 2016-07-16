# Generate EFI certificates to sign the kernel
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=xps/" -keyout PK.key -out PK.crt -days 3650 -nodes -sha256
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=xps/" -keyout KK.key -out KK.crt -days 3650 -nodes -sha256
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=xps/" -keyout db.key -out db.crt -days 3650 -nodes -sha256
cert-to-efi-sig-list -g 7fa04d43-c440-4ef6-b6b6-c0d527006ae4 PK.crt PK.esl 
sign-efi-sig-list -k PK.key -c PK.crt PK PK.esl PK.auth
