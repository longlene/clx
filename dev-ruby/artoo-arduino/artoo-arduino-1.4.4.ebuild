# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Artoo adaptor and driver for Arduino"
HOMEPAGE="https://github.com/hybridgroup/artoo-arduino"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/artoo-1.6.0"
ruby_add_rdepend ">=dev-ruby/artoo-gpio-0.4.1"
ruby_add_rdepend ">=dev-ruby/artoo-i2c-0.5.0"
ruby_add_rdepend ">=dev-ruby/hybridgroup-firmata-0.4.6"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/minitest-happy-1.0.0"
ruby_add_rdepend ">=dev-ruby/mocha-0.14.0"

