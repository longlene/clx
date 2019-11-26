# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This is a fork of the [hoe-hg](https://bitbucket"
HOMEPAGE="http://bitbucket.org/ged/hoe-mercurial"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hoe-3.9"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.1.0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"

