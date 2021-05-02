# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Text 2 speech using Google Translate service"
HOMEPAGE="http://github.com/pioz/speak"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pkg-config-1.1.1"
ruby_add_rdepend ">=dev-ruby/glib2-0.90.8"
ruby_add_rdepend ">=dev-ruby/gstreamer-0.90.8"

