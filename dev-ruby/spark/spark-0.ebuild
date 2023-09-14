# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://github.com/elliottcable/spark"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/speck-1"
ruby_add_rdepend ">=dev-ruby/rake-10.0.0"
ruby_add_rdepend ">=dev-ruby/yard-0.8.5.2"
ruby_add_rdepend ">=dev-ruby/maruku-0.6.1"

