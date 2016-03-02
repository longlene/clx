# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Diary makes it easy to maintain a file based website with template blog posts and pages"
HOMEPAGE="http://rubygems.org/gems/diary"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/bluecloth-2.0.11"
ruby_add_rdepend ">=dev-ruby/sinatra-1.1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"

