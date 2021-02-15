FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

RDEPENDS_${PN} += "bash"

SRC_URI += " \
            file://weston.ini \
            file://utilities-terminal.png \
            file://background.jpg \
            file://weston@.service \
            file://entry.sh \
            "

FILES_${PN} += " ${datadir}/weston \
         ${sysconfdir}/xdg/weston/weston.ini \
         /home/root \
         "

CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini"

do_install_append() {
    install -d ${D}${sysconfdir}/xdg/weston/
    install -d ${D}${datadir}/weston/backgrounds
    install -d ${D}${datadir}/weston/icon
    install -d ${D}${datadir}/weston/

    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/utilities-terminal.png ${D}${datadir}/weston/icon/utilities-terminal.png
    install -m 0644 ${WORKDIR}/background.jpg ${D}${datadir}/weston/backgrounds/background.jpg

    install -m 0755 ${WORKDIR}/entry.sh ${D}${datadir}/weston/
}

FILES_${PN} += "${systemd_system_unitdir}/weston@.service"
FILES_${PN} += "${systemd_unitdir}/system-preset"
FILES_${PN} += "${datadir} ${datadir}/weston/"
