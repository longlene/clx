# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Converts markdown to styled html with code highlighting"
HOMEPAGE="https://github.com/jrmoran/md2html"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hpricot-0"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0"

