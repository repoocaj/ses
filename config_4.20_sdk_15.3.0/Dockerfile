FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install -y libx11-6 libfreetype6 libxrender1 libfontconfig1 libxext6 xvfb curl unzip python-pip git zip && \
	pip install nrfutil

RUN Xvfb :1 -screen 0 1024x768x16 &

ENV TMPDIR="/tmp/install"

RUN mkdir -p ${TMPDIR} && \
	cd ${TMPDIR} && \
	curl https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRFCommandLineTools1030Linuxamd64tar.gz -o nrftools.tar.gz && \
	tar xf nrftools.tar.gz && \
	dpkg -i --force-overwrite JLink_Linux_V644e_x86_64.deb && \
	dpkg -i --force-overwrite nRF-Command-Line-Tools_10_3_0_Linux-amd64.deb && \
	cd .. && \
	rm -rf ${TMPDIR}

ENV PATH="/opt/mergehex:/opt/nrfjprog:$PATH"

RUN mkdir -p ${TMPDIR} && \
	cd ${TMPDIR} && \
	curl https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v420_linux_x64.tar.gz -o ses.tar.gz && \
	tar xf ses.tar.gz && \
	echo "yes" | DISPLAY=:1 $(find arm_segger_* -name "install_segger*") --copy-files-to /ses && \
	cd .. && \
	rm -rf ${TMPDIR}

RUN curl https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip -o nRF5_SDK_15.3.0_59ac345.zip && \
	unzip nRF5_SDK_15.3.0_59ac345.zip && \
	rm nRF5_SDK_15.3.0_59ac345.zip

CMD ["/ses/bin/emBuild"]
