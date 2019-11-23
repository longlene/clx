# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ronin Scanners is a Ruby library for Ronin that provides Ruby interfaces to
various third-party security scanners"
HOMEPAGE="http://ronin.rubyforge.org/scanners/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/scandb-0.1.3"
ruby_add_rdepend ">=dev-ruby/rprogram-0.1.6"
ruby_add_rdepend ">=dev-ruby/ronin-0.2.4"
ruby_add_rdepend ">=dev-ruby/hoe-2.3.2"

