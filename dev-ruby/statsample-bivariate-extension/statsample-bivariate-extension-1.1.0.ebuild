# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides advanced bivariate statistics:
* Tetrachoric correlation
* Polychoric correlation"
HOMEPAGE="http://ruby-statsample.rubyforge.org/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/distribution-0.6"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"

