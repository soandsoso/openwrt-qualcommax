PART_NAME=firmware
REQUIRE_IMAGE_METADATA=1

RAMFS_COPY_BIN='fw_printenv fw_setenv head'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'


platform_check_image() {
	return 0;
}

platform_pre_upgrade() {
	case "$(board_name)" in
	esac
}

platform_do_upgrade() {
	case "$(board_name)" in
	cmiot,ax18|\
 	zn,m2|\
	qihoo,v6|\
	glinet,gl-axt1800|\
	glinet,gl-ax1800|\
	redmi,ax5|\
	xiaomi,ax1800)
		nand_do_upgrade "$1"
		;;
	redmi,ax5-jdcloud|\
	jdc,ax1800-pro)
		kernelname="0:HLOS"
		rootfsname="rootfs"
		mmc_do_upgrade "$1"
		;;
	*)
		default_do_upgrade "$1"
		;;
	esac
}
