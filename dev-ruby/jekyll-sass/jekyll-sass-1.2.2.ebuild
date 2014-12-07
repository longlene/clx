# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Convert Sass SCSS files to standard CSS files as part of your Jekyll build"
HOMEPAGE="http://github.com/noct/jekyll-sass"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-0.10.0"
ruby_add_rdepend ">=dev-ruby/sass-3.0.0"
ruby_add_rdepend ">=dev-ruby/colorator-0.1"

