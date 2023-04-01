# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A plugin for adding an SVG liquid tag to Jekyll"
HOMEPAGE="http://github.com/dekellum/jekyll-svg-plugin"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/image_size-1.0.3"
ruby_add_rdepend ">=dev-ruby/rjack-tarpit-1.3.3"

