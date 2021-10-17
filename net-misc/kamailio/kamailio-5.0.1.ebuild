# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit eutils flag-o-matic python-single-r1 toolchain-funcs multilib user systemd vcs-snapshot

DESCRIPTION="Sip-Router (Kamailio/SER) is an Open Source SIP Server"
HOMEPAGE="http://kamailio.org/"
SRC_URI="https://github.com/kamailio/kamailio/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#Documentation can be found here: http://www.kamailio.org/docs/modules/4.4.x/
IUSE_KAMAILIO_MODULES="kamailio_modules_acc kamailio_modules_acc_radius kamailio_modules_alias_db kamailio_modules_app_java kamailio_modules_app_lua kamailio_modules_app_mono kamailio_modules_app_perl
		       kamailio_modules_app_python kamailio_modules_async kamailio_modules_auth kamailio_modules_auth_ephemeral kamailio_modules_auth_identity kamailio_modules_auth_db
		       kamailio_modules_auth_diameter kamailio_modules_auth_radius kamailio_modules_auth_xkeys kamailio_modules_avp kamailio_modules_avpops kamailio_modules_benchmark
		       kamailio_modules_blst kamailio_modules_call_control kamailio_modules_carrierroute kamailio_modules_cdp kamailio_modules_cdp_avp kamailio_modules_cfg_db kamailio_modules_cfg_rpc
		       kamailio_modules_cfgutils kamailio_modules_cfgt kamailio_modules_cnxcc kamailio_modules_corex kamailio_modules_counters kamailio_modules_cpl-c kamailio_modules_crypto
		       kamailio_modules_ctl kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb
		       kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text
		       kamailio_modules_db_unixodbc kamailio_modules_db2_ldap kamailio_modules_db2_ops kamailio_modules_debugger kamailio_modules_dialog kamailio_modules_dialog_ng kamailio_modules_dialplan
		       kamailio_modules_dispatcher kamailio_modules_diversion kamailio_modules_dmq kamailio_modules_dmq_usrloc kamailio_modules_dnssec kamailio_modules_domain kamailio_modules_domainpolicy
		       kamailio_modules_drouting kamailio_modules_enum kamailio_modules_erlang kamailio_modules_evapi kamailio_modules_exec kamailio_modules_geoip kamailio_modules_geoip2
		       kamailio_modules_group kamailio_modules_gzcompress kamailio_modules_h350 kamailio_modules_htable kamailio_modules_http_client kamailio_modules_http_async_client
		       kamailio_modules_ims_auth kamailio_modules_ims_charging kamailio_modules_ims_dialog kamailio_modules_ims_icscf kamailio_modules_ims_isc kamailio_modules_ims_qos
		       kamailio_modules_ims_registrar_pcscf kamailio_modules_ims_registrar_scscf kamailio_modules_ims_usrloc_pcscf kamailio_modules_ims_usrloc_scscf kamailio_modules_imc
		       kamailio_modules_ipops kamailio_modules_iptrtpproxy kamailio_modules_jabber kamailio_modules_jansson kamailio_modules_janssonrpc-c kamailio_modules_json kamailio_modules_jsonrpc-c
		       kamailio_modules_jsonrpc-s kamailio_modules_kazoo kamailio_modules_kex kamailio_modules_lcr kamailio_modules_ldap kamailio_modules_log_custom kamailio_modules_log_systemd
		       kamailio_modules_malloc_test kamailio_modules_mangler kamailio_modules_matrix kamailio_modules_maxfwd kamailio_modules_mediaproxy kamailio_modules_memcached
		       kamailio_modules_misc_radius kamailio_modules_mi_datagram kamailio_modules_mi_fifo kamailio_modules_mi_rpc kamailio_modules_mi_xmlrpc kamailio_modules_mohqueue
		       kamailio_modules_mqueue kamailio_modules_msilo kamailio_modules_msrp kamailio_modules_mtree kamailio_modules_nathelper kamailio_modules_nat_traversal kamailio_modules_ndb_cassandra
		       kamailio_modules_ndb_mongodb kamailio_modules_ndb_redis kamailio_modules_nosip kamailio_modules_osp kamailio_modules_outbound kamailio_modules_p_usrloc kamailio_modules_path kamailio_modules_pdb
		       kamailio_modules_pdt kamailio_modules_peering kamailio_modules_permissions kamailio_modules_pike kamailio_modules_pipelimit kamailio_modules_prefix_route kamailio_modules_presence
		       kamailio_modules_presence_conference kamailio_modules_presence_dialoginfo kamailio_modules_presence_mwi kamailio_modules_presence_profile kamailio_modules_presence_xml
		       kamailio_modules_presence_reginfo kamailio_modules_print kamailio_modules_print_lib kamailio_modules_pua kamailio_modules_pua_bla kamailio_modules_pua_dialoginfo kamailio_modules_pua_mi
		       kamailio_modules_pua_reginfo kamailio_modules_pua_usrloc kamailio_modules_pua_xmpp kamailio_modules_purple kamailio_modules_pv kamailio_modules_qos kamailio_modules_ratelimit
		       kamailio_modules_regex kamailio_modules_registrar kamailio_modules_rls kamailio_modules_rr kamailio_modules_rtimer kamailio_modules_rtjson kamailio_modules_rtpengine
		       kamailio_modules_rtpproxy kamailio_modules_sanity kamailio_modules_sca kamailio_modules_sctp kamailio_modules_sdpops kamailio_modules_seas kamailio_modules_sipcapture
		       kamailio_modules_sipt kamailio_modules_siptrace kamailio_modules_siputils kamailio_modules_sl kamailio_modules_sms kamailio_modules_smsops kamailio_modules_snmpstats
		       kamailio_modules_speeddial kamailio_modules_sqlops kamailio_modules_sst kamailio_modules_statistics kamailio_modules_statsc kamailio_modules_statsd kamailio_modules_stun
		       kamailio_modules_tcpops kamailio_modules_textops kamailio_modules_textopsx kamailio_modules_timer kamailio_modules_tls kamailio_modules_tm kamailio_modules_tmrec kamailio_modules_tmx
		       kamailio_modules_topoh kamailio_modules_topos kamailio_modules_tsilo kamailio_modules_uac kamailio_modules_uac_redirect kamailio_modules_uid_auth_db kamailio_modules_uid_avp_db
		       kamailio_modules_uid_domain kamailio_modules_uid_gflags kamailio_modules_uid_uri_db kamailio_modules_uri_db kamailio_modules_userblacklist kamailio_modules_usrloc kamailio_modules_utils
		       kamailio_modules_uuid kamailio_modules_websocket kamailio_modules_xcap_client kamailio_modules_xcap_server kamailio_modules_xhttp kamailio_modules_xhttp_pi kamailio_modules_xhttp_rpc
		       kamailio_modules_xlog kamailio_modules_xmlops kamailio_modules_xmlrpc kamailio_modules_xmpp kamailio_modules_xprint
"
IUSE="${IUSE_KAMAILIO_MODULES} ipv6 debug"
IUSE_EXPAND="KAMAILIO_MODULES"

REQUIRED_USE="
        kamailio_modules_acc?            ( kamailio_modules_tm kamailio_modules_rr kamailio_modules_dialog || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_acc_radius?     ( kamailio_modules_acc )
        kamailio_modules_alias_db?       ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_app_perl?       ( kamailio_modules_sl )
        kamailio_modules_async?          ( kamailio_modules_tm kamailio_modules_tmx )
        kamailio_modules_auth_ephemeral? ( kamailio_modules_auth )
        kamailio_modules_auth_db?        ( kamailio_modules_auth || ( kamailio_modules_db_mysql kamailio_modules_db_postgres kamailio_modules_db_text ) )
        kamailio_modules_auth_diameter?  ( kamailio_modules_sl )
        kamailio_modules_auth_radius?    ( kamailio_modules_auth )
        kamailio_modules_call_control?   ( kamailio_modules_pv kamailio_modules_dialog )
        kamailio_modules_carrierroute?   ( kamailio_modules_tm || ( kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_postgres kamailio_modules_db_unixodbc ) )
        kamailio_modules_cdp_avp?        ( kamailio_modules_cdp )
        kamailio_modules_cfg_db?         ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_cnxcc?          ( kamailio_modules_dialog )
        kamailio_modules_cpl-c?          ( kamailio_modules_tm kamailio_modules_sl kamailio_modules_usrloc || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_db_cluster?     ( || ( kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_postgres kamailio_modules_db_unixodbc ) )
        kamailio_modules_db_perlvdb?     ( kamailio_modules_app_perl )
        kamailio_modules_dialog?         ( kamailio_modules_tm kamailio_modules_rr kamailio_modules_pv )
        kamailio_modules_dialog_ng?      ( kamailio_modules_tm kamailio_modules_rr )
        kamailio_modules_dialplan?       ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_dispatcher?     ( kamailio_modules_tm || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_dmq?            ( kamailio_modules_sl kamailio_modules_tm )
        kamailio_modules_dmq_usrloc?     ( kamailio_modules_dmq kamailio_modules_usrloc )
        kamailio_modules_domain?         ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_domainpolicy?   ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_drouting?       ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_evapi?          ( kamailio_modules_tm )
        kamailio_modules_group?          ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_h350?           ( kamailio_modules_ldap )
        kamailio_modules_http_async_client?      ( kamailio_modules_tm kamailio_modules_pv )
        kamailio_modules_ims_auth?       ( kamailio_modules_tm kamailio_modules_cdp kamailio_modules_cdp_avp )
        kamailio_modules_ims_charging?   ( kamailio_modules_ims_dialog kamailio_modules_tm kamailio_modules_cdp kamailio_modules_cdp_avp )
        kamailio_modules_ims_dialog?     ( kamailio_modules_tm kamailio_modules_rr )
        kamailio_modules_ims_icscf?      ( kamailio_modules_tm kamailio_modules_sl kamailio_modules_cdp kamailio_modules_cdp_avp )
        kamailio_modules_ims_isc?        ( kamailio_modules_tm kamailio_modules_ims_usrloc_scscf )
        kamailio_modules_ims_qos?        ( kamailio_modules_dialog_ng kamailio_modules_ims_usrloc_pcscf kamailio_modules_tm kamailio_modules_cdp kamailio_modules_cdp_avp )
        kamailio_modules_ims_registrar_scscf?    ( kamailio_modules_cdp kamailio_modules_cdp_avp kamailio_modules_tm kamailio_modules_ims_usrloc_scscf )
        kamailio_modules_ims_registrar_pcscf?    ( kamailio_modules_cdp kamailio_modules_cdp_avp kamailio_modules_tm kamailio_modules_ims_usrloc_pcscf )
        kamailio_modules_imc?            ( kamailio_modules_db_mysql kamailio_modules_tm )
        kamailio_modules_janssonrpc-c?   ( kamailio_modules_jansson kamailio_modules_tm )
        kamailio_modules_jsonrpc-c?      ( kamailio_modules_tm )
        kamailio_modules_jsonrpc-s?      ( kamailio_modules_xhttp )
        kamailio_modules_lcr?            ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_mediaproxy?     ( kamailio_modules_dialog )
        kamailio_modules_mohqueue?       ( kamailio_modules_tm kamailio_modules_sl kamailio_modules_rtpproxy || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_msilo?          ( kamailio_modules_tm || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_mtree?          ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_nathelper?      ( kamailio_modules_usrloc )
        kamailio_modules_nat_traversal?  ( kamailio_modules_sl kamailio_modules_tm kamailio_modules_dialog )
        kamailio_modules_osp?            ( kamailio_modules_sl kamailio_modules_tm kamailio_modules_rr kamailio_modules_textops kamailio_modules_siputils )
        kamailio_modules_p_usrloc?       ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_path?           ( kamailio_modules_rr kamailio_modules_outbound )
        kamailio_modules_pdt?            ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_pipelimit?      ( kamailio_modules_sl || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_presence?       ( kamailio_modules_sl kamailio_modules_tm || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_presence_conference?    ( kamailio_modules_presence )
        kamailio_modules_presence_dialoginfo?    ( kamailio_modules_presence )
        kamailio_modules_presence_mwi?   ( kamailio_modules_presence )
        kamailio_modules_presence_profile?       ( kamailio_modules_presence )
        kamailio_modules_presence_xml?   ( kamailio_modules_presence kamailio_modules_sl kamailio_modules_xcap_client || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_presence_reginfo?       ( kamailio_modules_presence )
        kamailio_modules_pua?            ( kamailio_modules_tm || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_pua_bla?        ( kamailio_modules_usrloc kamailio_modules_pua kamailio_modules_presence )
        kamailio_modules_pua_dialoginfo? ( kamailio_modules_dialog kamailio_modules_pua )
        kamailio_modules_pua_mi?         ( kamailio_modules_pua )
        kamailio_modules_pua_reginfo?    ( kamailio_modules_pua kamailio_modules_usrloc )
        kamailio_modules_pua_usrloc?     ( kamailio_modules_usrloc kamailio_modules_pua )
        kamailio_modules_pua_xmpp?       ( kamailio_modules_presence kamailio_modules_pua kamailio_modules_xmpp )
        kamailio_modules_purple?         ( kamailio_modules_presence kamailio_modules_pua || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_qos?            ( kamailio_modules_dialog )
        kamailio_modules_ratelimit?      ( kamailio_modules_sl )
        kamailio_modules_registrar?      ( kamailio_modules_usrloc kamailio_modules_sl )
        kamailio_modules_rls?            ( kamailio_modules_tm kamailio_modules_sl kamailio_modules_presence kamailio_modules_pua || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_rr?             ( kamailio_modules_outbound )
        kamailio_modules_rtjson?         ( kamailio_modules_tm kamailio_modules_uac )
        kamailio_modules_rtpengine?      ( kamailio_modules_tm )
        kamailio_modules_rtpproxy?       ( kamailio_modules_tm )
        kamailio_modules_sanity?         ( kamailio_modules_sl )
        kamailio_modules_sca?            ( kamailio_modules_sl kamailio_modules_tm || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_seas?           ( kamailio_modules_tm )
        kamailio_modules_sipcapture?     ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_siptrace?       ( kamailio_modules_tm kamailio_modules_sl || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_siputils?       ( kamailio_modules_sl )
        kamailio_modules_sms?            ( kamailio_modules_tm )
        kamailio_modules_snmpstats?      ( kamailio_modules_usrloc || ( kamailio_modules_dialog kamailio_modules_dialog_ng ) )
        kamailio_modules_speeddial?      ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_sqlops?         ( || ( kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_unixodbc ) )
        kamailio_modules_sst?            ( kamailio_modules_sl || ( kamailio_modules_dialog kamailio_modules_dialog_ng ) )
        kamailio_modules_tmx?            ( kamailio_modules_tm )
        kamailio_modules_topoh?          ( kamailio_modules_rr )
        kamailio_modules_topos?          ( kamailio_modules_rr || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_tsilo?          ( kamailio_modules_registrar kamailio_modules_tm kamailio_modules_usrloc kamailio_modules_sl )
        kamailio_modules_uac?            ( kamailio_modules_tm kamailio_modules_rr kamailio_modules_dialog )
        kamailio_modules_uac_redirect?   ( kamailio_modules_tm kamailio_modules_acc )
        kamailio_modules_auth_db?        ( kamailio_modules_auth || ( kamailio_modules_db_mysql kamailio_modules_db_postgres kamailio_modules_db_text ) )
        kamailio_modules_uri_db?         ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_userblacklist?  ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_usrloc?         ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_utils?          ( || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_websocket?      ( kamailio_modules_sl kamailio_modules_tm kamailio_modules_msrp || ( kamailio_modules_nathelper kamailio_modules_outbound ) )
        kamailio_modules_xcap_server?    ( kamailio_modules_sl kamailio_modules_xhttp || ( kamailio_modules_db_berkeley kamailio_modules_db_cassandra kamailio_modules_db_cluster kamailio_modules_db_flatstore kamailio_modules_db_mongodb kamailio_modules_db_mysql kamailio_modules_db_oracle kamailio_modules_db_perlvdb kamailio_modules_db_postgres kamailio_modules_db_sqlite kamailio_modules_db_text kamailio_modules_db_unixodbc ) )
        kamailio_modules_xhttp?          ( kamailio_modules_sl )
        kamailio_modules_xhttp_pi?       ( kamailio_modules_xhttp )
        kamailio_modules_xhttp_rpc?      ( kamailio_modules_xhttp )
        kamailio_modules_xlog?           ( kamailio_modules_pv )
        kamailio_modules_xmlrpc?         ( kamailio_modules_sl )
        kamailio_modules_xmpp?           ( kamailio_modules_tm )
"

DEPEND="app-text/docbook2X
	kamailio_modules_acc? 		( >=net-dialup/radiusclient-ng-0.5.0 )
	kamailio_modules_app_java?	( >=virtual/jdk-1.6
					  dev-java/gcj-jdk )
	kamailio_modules_app_lua?	( dev-lang/lua )
	kamailio_modules_app_mono?	( dev-lang/mono )
	kamailio_modules_app_perl?	( dev-lang/perl
					  dev-perl/perl-ldap
					  dev-perl/IPC-Shareable )
	kamailio_modules_app_python?	( dev-lang/python:2.7 )
	kamailio_modules_auth_ephemeral?	( dev-libs/openssl )
	kamailio_modules_auth_identity?	( >dev-libs/openssl-0.9.8
					  net-misc/curl )
	kamailio_modules_auth_radius?	( >=net-dialup/radiusclient-ng-0.5.0 )
	kamailio_modules_carrierroute?	( dev-libs/confuse )
	kamailio_modules_cnxcc?		( dev-libs/hiredis
					  dev-libs/libevent )
	kamailio_modules_cpl-c?		( dev-libs/libxml2 )
	kamailio_modules_crypto?	( dev-libs/openssl )
	kamailio_modules_db_berkeley?	( sys-libs/db )
	kamailio_modules_db_cassandra?	( dev-libs/thrift )
	kamailio_modules_db_mongodb?	( dev-libs/mongo-c-driver )
	kamailio_modules_db_mysql?	( virtual/libmysqlclient )
	kamailio_modules_db_unixodbc?	( dev-db/unixODBC )
	kamailio_modules_db_oracle?	( dev-db/oracle-instantclient )
	kamailio_modules_db_postgres?	( dev-db/postgresql )
	kamailio_modules_db_sqlite?	( dev-db/sqlite:3[tools] )
	kamailio_modules_dialplan?	( dev-libs/libpcre )
	kamailio_modules_dnssec?	( net-dns/dnssec-tools )
	kamailio_modules_erlang?	( dev-lang/erlang )
	kamailio_modules_evapi?		( dev-libs/libev )
	kamailio_modules_geoip?		( dev-libs/geoip )
	kamailio_modules_geoip2?	( dev-libs/libmaxminddb )
	kamailio_modules_gzcompress?	( sys-libs/zlib )
	kamailio_modules_h350?		( net-nds/openldap )
	kamailio_modules_http_client?	( net-misc/curl )
	kamailio_modules_http_async_client?	( net-misc/curl
						  dev-libs/libev )
	kamailio_modules_ims_registrar_scscf?	( dev-libs/libxml2 )
	kamailio_modules_jansson?	( dev-libs/jansson )
	kamailio_modules_janssonrpc-c?	( dev-libs/jansson
					  dev-libs/libevent )
	kamailio_modules_json?		( dev-libs/json-c )
	kamailio_modules_jsonrpc-c?	( dev-libs/json-c
					  dev-libs/libevent
					  sys-libs/glibc )
	kamailio_modules_kazoo?		( dev-libs/json-c
					  net-misc/rabbitmq-server
					  dev-erlang/uuid )
	kamailio_modules_lcr?		( dev-libs/libpcre )
	kamailio_modules_ldap?		( net-nds/openldap )
	kamailio_modules_log_systemd?	( sys-apps/systemd )
	kamailio_modules_mediaproxy?	( net-proxy/mediaproxy )
	kamailio_modules_memcached?	( dev-libs/libmemcached
					  net-misc/memcached )
	kamailio_modules_misc_radius?	( >=net-dialup/radiusclient-ng-0.5.0 )
	kamailio_modules_mi_xmlrpc?	( dev-libs/libxml2
					  dev-libs/xmlrpc-c[abyss] )
	kamailio_modules_ndb_cassandra?	( dev-libs/thrift )
	kamailio_modules_ndb_mongodb?	( dev-libs/mongo-c-driver )
	kamailio_modules_ndb_redis?	( dev-libs/hiredis )
	kamailio_modules_osp?		( net-libs/osptoolkit )
	kamailio_modules_outbound?	( dev-libs/openssl )
	kamailio_modules_peering?	( >=net-dialup/radiusclient-ng-0.5.0 )
	kamailio_modules_presence?	( dev-libs/libxml2 )
	kamailio_modules_presence_conference?	( dev-libs/libxml2 )
	kamailio_modules_presence_xml?	( dev-libs/libxml2 )
	kamailio_modules_pua?		( dev-libs/libxml2 )
	kamailio_modules_pua_bla?	( dev-libs/libxml2 )
	kamailio_modules_pua_dialoginfo?	( dev-libs/libxml2 )
	kamailio_modules_pua_usrloc?	( dev-libs/libxml2 )
	kamailio_modules_pua_xmpp?	( dev-libs/libxml2 )
	kamailio_modules_purple?		( net-im/pidgin )
	kamailio_modules_regex?		( dev-libs/libpcre )
	kamailio_modules_rls?		( dev-libs/libxml2 )
	kamailio_modules_sctp?		( net-misc/lksctp-tools )
	kamailio_modules_snmpstats?	( net-analyzer/net-snmp )
	kamailio_modules_utils?		( net-misc/curl )
	kamailio_modules_uuid?		( dev-libs/ossp-uuid )
	kamailio_modules_websocket?	( dev-libs/openssl
					  dev-libs/libunistring )
	kamailio_modules_xcap_client?	( net-misc/curl
					  dev-libs/libxml2 )
	kamailio_modules_xcap_server?	( dev-libs/libxml2 )
	kamailio_modules_xhttp_pi?	( dev-libs/libxml2 )
	kamailio_modules_xmlops?	( dev-libs/libxml2 )
	kamailio_modules_xmlrpc?	( dev-libs/expat )
"

RDEPEND="${DEPEND}
	>=sys-devel/bison-1.35
	>=sys-devel/flex-2.5.4a
	>=sys-libs/ncurses-5.7
	>=sys-libs/readline-6.1_p2
"

pkg_setup() {
        use kamailio_modules_app_python && python-single-r1_pkg_setup
}

src_configure() {
        cd "${S}"
        for i in ${IUSE_KAMAILIO_MODULES};
	do
	if use $i; then
		KAMODULES="${KAMODULES} $(echo $i | sed -e 's/kamailio_modules_//g')"
	else
		EXCMODULES="${EXCMODULES} $(echo $i | sed -e 's/kamailio_modules_//g')"
	fi
	done

	KAMODULES=${KAMODULES:1}
	EXCMODULES=${EXCMODULES:1}

	if use kamailio_modules_tls; then
		tls_hooks=1
	else
		tls_hooks=0
	fi

	if use debug; then
		mode=debug
	else
		mode=release
	fi

	if use kamailio_modules_sctp; then
		sctp=1
	else
		sctp=0
	fi

	emake \
		prefix="/" \
		include_modules="${KAMODULES}" \
		exclude_modules="${EXCMODULES}" \
		SCTP="${sctp}" \
		mode="${mode}" \
		TLS_HOOKS="${tls_hooks}" \
		cfg_prefix="${D}" \
                cfg_dir="/etc/${PN}/" \
                cfg_target="/etc/${PN}/" \
                mode="release" \
                doc_dir="share/doc/${P}/" \
		cfg
}

src_compile() {
        use amd64 && append-cflags "-fPIC"
        emake \
                CC="$(tc-getCC)" \
                CPU_TYPE="$(get-flag march)" \
                all || die
}

src_install () {
        emake \
		BASEDIR="${D}" \
		prefix="/" \
		bin_dir=/usr/sbin/ \
		cfg_dir=/etc/${PN}/ \
		lib_dir=/usr/$(get_libdir)/${PN}/ \
		modules_dir="/usr/$(get_libdir)/${PN}/" \
		man_dir="/usr/share/man/" \
		doc_dir="/usr/share/doc/${flavour}/" \
		share_dir="/usr/share/${flavour}/" \
		data_dir="/usr/share/${flavour}/" \
                install || die
}

pkg_preinst() {
	ebegin "Creating ${PN} user and group"
	enewgroup ${PN}
	enewuser  ${PN} -1 -1 /var/run/${PN} ${PN}
	eend $?

	chown -R root:${PN}  ${D}/etc/${PN}
	chmod -R u=rwX,g=rX,o= ${D}/etc/${PN}

	systemd_dounit "${FILESDIR}/${PN}.service"

	insinto /etc/default
	newins "${FILESDIR}/${PN}.default" ${PN}
}

pkg_postinst() {
        ewarn "**************************** Warning! ******************************"
        ewarn "Preliminary ebuild - Use with caution"
        ewarn "**************************** Warning! ******************************"
}
