# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Livereload module for Inesita"
HOMEPAGE="http://github.com/inesita-rb/inesita-livereload"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opal-0.9"
ruby_add_rdepend ">=dev-ruby/listen-3.0"
ruby_add_rdepend ">=dev-ruby/websocket-1.0"

