PLUGIN_NAME=		dnsmasq-to-unbound
PLUGIN_VERSION=		1.0
PLUGIN_REVISION=	0
PLUGIN_DEPENDS=		dnsmasq
PLUGIN_COMMENT=		Register dnsmasq DHCP leases and static hosts in Unbound DNS
PLUGIN_MAINTAINER=	chall37@users.noreply.github.com
PLUGIN_DEVEL=

.include "../../Mk/plugins.mk"
