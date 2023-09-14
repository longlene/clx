# Distributed under the terms of the GNU General Public License v2

EAPI=8
#USE_RUBY="ruby31 ruby32"
USE_RUBY="ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
#RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A beautiful, minimal theme for Jekyll"
HOMEPAGE="https://github.com/jekyll/minima"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=www-apps/jekyll-3.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.12"

RUBY_FAKEGEM_EXTRAINSTALL="_includes _layouts _sass assets"
