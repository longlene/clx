# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Written to play with Ruby"
HOMEPAGE="http://github.com/Mon-Ouie/ray"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="media-libs/libsndfile
media-libs/glew"

ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/riot-0"
ruby_add_rdepend ">=dev-ruby/rr-0"

