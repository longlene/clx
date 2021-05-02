# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Crass is a pure Ruby CSS parser based on the CSS Syntax Level 3 draft"
HOMEPAGE="https://github.com/rgrove/crass/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.0.8"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}

each_ruby_prepare() {
	rm .gitignore .yardopts .travis.yml

}
