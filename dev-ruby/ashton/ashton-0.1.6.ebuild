# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Extra special effects, such as shader, for the Gosu game-development library
"
HOMEPAGE="https://github.com/spooner/ashton"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opengl-0.9.0"
ruby_add_rdepend ">=dev-ruby/gosu-0.7"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.8.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.10.0"
ruby_add_rdepend ">=dev-ruby/rr-1.0.4"
ruby_add_rdepend ">=dev-ruby/launchy-2.1.0"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.2.9"
ruby_add_rdepend ">=dev-ruby/redcarpet-2.1.1"
ruby_add_rdepend ">=dev-ruby/yard-0.8.2.1"
ruby_add_rdepend ">=dev-ruby/texplay-0.4.3"

