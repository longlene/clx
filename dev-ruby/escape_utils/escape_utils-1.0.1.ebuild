# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Quickly perform HTML, URL, URI and Javascript escaping/unescaping"
HOMEPAGE="https://github.com/brianmario/escape_utils"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-compiler-0.7.5"
ruby_add_rdepend ">=dev-ruby/minitest-5.0.0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/fast_xs-0"
ruby_add_rdepend ">=dev-ruby/actionpack-0"
ruby_add_rdepend ">=dev-ruby/url_escape-0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
