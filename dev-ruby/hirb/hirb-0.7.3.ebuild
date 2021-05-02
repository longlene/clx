# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Hirb provides a mini view framework for console applications and uses it to improve ripl(irb)'s default inspect output"
HOMEPAGE="http://tagaholic.me/hirb/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bacon-1.1.0"
ruby_add_rdepend ">=dev-ruby/mocha-0.12.1"
ruby_add_rdepend ">=dev-ruby/mocha-on-bacon-0.2.1"
ruby_add_rdepend ">=dev-ruby/bacon-bits-0"

