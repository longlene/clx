# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Implements a simple system for handling xml news feeds with caching"
HOMEPAGE="http://sporkmonger.com/projects/feedtools"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-1.10.1"
ruby_add_rdepend ">=dev-ruby/uuidtools-1.0.0"
ruby_add_rdepend ">=dev-ruby/builder-1.2.4"

