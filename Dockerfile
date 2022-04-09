FROM developeranaz/qbittorrent2rclone:beta1
RUN apt update
RUN apt install mediainfo -y
RUN apt install pip -y
RUN pip install bs4
RUN pip install colorama
RUN pip install wcwidth
RUN pip install requests
RUN pip install ffmpy
RUN pip install inquirer
RUN pip install pycountry
RUN pip install tqdm
RUN pip install future
RUN pip install cssutils
RUN pip install pycaption
RUN pip install pymediainfo
RUN pip install isodate
RUN pip install untangle
RUN pip install tldextract
RUN pip install unidecode
RUN pip install yarl
RUN pip install natsort
RUN pip install titlecase==2.0.0
RUN pip install prettytable
RUN pip install termcolor
RUN pip install pproxy
RUN pip install pysrt
RUN pip install protobuf
RUN pip install pycryptodomex
RUN apt install aria2 -y
RUN apt install git -y && \
	git clone https://github.com/axiomatic-systems/Bento4.git && \
	cd Bento4 && \
	mkdir "/tmp/Bento4" && \
	mkdir "/tmp/Bento4/cmakebuild" && \
	cmake -DCMAKE_BUILD_TYPE=Release .. && \
	make && \
	make install -y
RUN sh sudo sh -c 'echo "deb https://mkvtoolnix.download/ubuntu/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/bunkus.org.list' && \
	wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add - && \
	apt-get install mkvtoolnix mkvtoolnix-gui
RUN curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip' && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
	mkdir /tmp/cache && \
	chmod 777 /tmp/cache
RUN rclone version
COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /.config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh