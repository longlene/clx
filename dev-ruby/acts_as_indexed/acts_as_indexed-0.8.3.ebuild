# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Acts As Indexed is a plugin which provides a pain-free way to add fulltext search to your Ruby on Rails app"
HOMEPAGE="http://github.com/dougal/acts_as_indexed"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


