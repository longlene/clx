# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby interface to Nmap, the exploration tool and security / port scanner"
HOMEPAGE="https://github.com/sophsec/ruby-nmap#readme"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.3"
ruby_add_rdepend ">=dev-ruby/rprogram-0.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"

