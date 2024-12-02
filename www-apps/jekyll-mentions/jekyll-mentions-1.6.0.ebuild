# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="mention support for your Jekyll site"
HOMEPAGE="https://github.com/jekyll/jekyll-mentions"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-3.0"
ruby_add_rdepend ">=dev-ruby/html-pipeline-2.3"
ruby_add_rdepend ">=dev-ruby/activesupport-4.0"

