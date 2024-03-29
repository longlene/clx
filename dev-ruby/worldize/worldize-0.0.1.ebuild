# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Worldize allows to draw world countries coloured on base of some
    numeric value for each country"
HOMEPAGE="https://github.com/zverok/worldize"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rmagick-0"
ruby_add_rdepend ">=dev-ruby/hashie-0"
ruby_add_rdepend ">=dev-ruby/color-0"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0"

