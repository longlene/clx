# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="GeoIP searches a GeoIP database for a given host or IP address, and
returns information about the country where the IP address is allocated,
and the city, ISP and other information, if you have that database version"
HOMEPAGE="http://github.com/cjheath/geoip"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


