# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sprockets support for Middleman"
HOMEPAGE="https://github.com/middleman/middleman-sprockets"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/middleman-core-3.3"
ruby_add_rdepend ">=dev-ruby/sprockets-2.12.1"
ruby_add_rdepend ">=dev-ruby/sprockets-sass-1.2.0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-1.1.0"

