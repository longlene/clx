# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library extends http://artoo"
HOMEPAGE="https://github.com/iamvery/artoo-neopixel"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/artoo-arduino-1.0"
ruby_add_rdepend ">=dev-ruby/hybridgroup-firmata-0.2"
ruby_add_rdepend ">=dev-ruby/pry-0.9"
ruby_add_rdepend ">=dev-ruby/rake-10.4"

