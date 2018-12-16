# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="pluto-models - planet schema 'n' models for easy (re)use"
HOMEPAGE="https://github.com/feedreader/pluto"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/props-1.2.0"
ruby_add_rdepend ">=dev-ruby/logutils-0.6.1"
ruby_add_rdepend ">=dev-ruby/feedparser-2.1.0"
ruby_add_rdepend ">=dev-ruby/feedfilter-1.1.1"
ruby_add_rdepend ">=dev-ruby/textutils-1.4.0"
ruby_add_rdepend ">=dev-ruby/activerecord-0"
ruby_add_rdepend ">=dev-ruby/logutils-activerecord-0.2.1"
ruby_add_rdepend ">=dev-ruby/props-activerecord-0.2.0"
ruby_add_rdepend ">=dev-ruby/activityutils-0.1.1"
ruby_add_rdepend ">=dev-ruby/activerecord-utils-0.4.0"
