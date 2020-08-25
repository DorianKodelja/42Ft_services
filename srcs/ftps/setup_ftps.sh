# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_ftps.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jereligi <jereligi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/11 14:31:51 by jereligi          #+#    #+#              #
#    Updated: 2020/08/24 17:28:44 by jereligi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo -e "$PASSWORD\n$PASSWORD" | adduser -h /src/ftp/$USER $USER
mkdir -p /src/ftp/$USER
chown $USER:$USER /src/ftp/$USER
mkdir /src/ftp/$USER/folder_text
chown $USER:$USER /src/ftp/$USER/folder_text
touch /src/ftp/$USER/folder_text/text.txt

exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21010 -opasv_address=127.0.0.1 /etc/vsftpd/vsftpd.conf &
tail -f /dev/null
