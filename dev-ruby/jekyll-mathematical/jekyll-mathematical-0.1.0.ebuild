# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/gjtorikian/jekyll-mathematical"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-0"
ruby_add_rdepend ">=dev-ruby/mathematical-0.4"
ruby_add_rdepend ">=dev-ruby/math-to-itex-0.3"
ruby_add_rdepend ">=dev-ruby/rspec-2.13.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

