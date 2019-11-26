# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Jekyll plugin to automatically generate a tag cloud and tag pages"
HOMEPAGE="http://github.com/pattex/jekyll-tagging"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nuggets-0"
ruby_add_rdepend ">=dev-ruby/hen-0.8"
ruby_add_rdepend ">=dev-ruby/rake-0"

