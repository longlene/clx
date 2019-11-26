# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Lanyon is a good friend of Jekyll, the static site generator, and transforms your website into a Rack application"
HOMEPAGE="https://github.com/stomar/lanyon/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-2.0"
ruby_add_rdepend ">=dev-ruby/rack-1.6"

