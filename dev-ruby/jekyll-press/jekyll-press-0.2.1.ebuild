# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Minifier plugin for jekyll"
HOMEPAGE="http://github.com/stereobooster/jekyll-press"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-0"
ruby_add_rdepend ">=dev-ruby/html_press-0.8.2"
ruby_add_rdepend ">=dev-ruby/multi_css-0.1.0"
ruby_add_rdepend ">=dev-ruby/multi_js-0.1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

