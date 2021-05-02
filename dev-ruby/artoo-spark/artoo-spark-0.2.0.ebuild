# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Artoo adaptor for Spark"
HOMEPAGE="https://github.com/hybridgroup/artoo-spark"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/artoo-1.6.0"
ruby_add_rdepend ">=dev-ruby/artoo-gpio-0"
ruby_add_rdepend ">=dev-ruby/http-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/minitest-happy-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.14.0"

