FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install -y libx11-6 libfreetype6 libxrender1 libfontconfig1 libxext6 xvfb curl unzip python-pip git zip && \
	pip install nrfutil

RUN Xvfb :1 -screen 0 1024x768x16 &

ENV INSTALL="/tmp/install"

RUN mkdir -p ${INSTALL} && \
	cd ${INSTALL} && \
	curl https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRFCommandLineTools1050Linuxamd64tar.gz -o nrftools.tar.gz && \
	tar xf nrftools.tar.gz && \
	dpkg -i --force-overwrite JLink_Linux_V654c_x86_64.deb && \
	dpkg -i --force-overwrite nRF-Command-Line-Tools_10_5_0_Linux-amd64.deb && \
	cd .. && \
	rm -rf ${INSTALL}

ENV PATH="/opt/mergehex:/opt/nrfjprog:$PATH"

RUN mkdir -p ${INSTALL} && \
	cd ${INSTALL} && \
	curl https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v430c_linux_x64.tar.gz -o ses.tar.gz && \
	tar xf ses.tar.gz && \
	echo "yes" | DISPLAY=:1 $(find arm_segger_* -name "install_segger*") --copy-files-to /ses && \
	cd .. && \
	rm -rf ${INSTALL}

ENV INSTALL="/nordic"

RUN mkdir -p ${INSTALL} && \
	cd ${INSTALL} && \
	curl https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v16.x.x/nRF5_SDK_16.0.0_98a08e2.zip -o nRF5_SDK_16.0.0_98a08e2.zip && \
	unzip nRF5_SDK_16.0.0_98a08e2.zip && \
	rm nRF5_SDK_16.0.0_98a08e2.zip && \
	ln -sf ${INSTALL}/nRF5_SDK_16.0.0_98a08e2 /sdk && \
	cd ..

ENV INSTALL=

CMD ["/ses/bin/emBuild"]
