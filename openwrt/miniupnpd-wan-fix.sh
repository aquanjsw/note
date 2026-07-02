#!/bin/sh
# /etc/hotplug.d/iface/95-miniupnpd-wan-fix
# miniupnpd get stucked when WAN IP changes

. /lib/functions/network.sh

network_find_wan external_iface

if [ -z "$external_iface" ]; then
	logger -t upnp-fix "cannot find external_iface"
	exit 1
fi

if [ "$ACTION" = "ifup" ] && [ "$INTERFACE" = "$external_iface" ]; then
	logger -t upnp-fix "$external_iface is up. Force restarting miniupnpd to clear ghost lease memory..."
	sleep 3
	/etc/init.d/miniupnpd restart
fi
