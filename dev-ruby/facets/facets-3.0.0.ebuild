# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Facets is the premier collection of extension methods for the Ruby programming language"
HOMEPAGE="http://rubyworks.github.com/facets"

LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/lemon-0"
ruby_add_rdepend ">=dev-ruby/qed-0"
ruby_add_rdepend ">=dev-ruby/rubytest-cli-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

