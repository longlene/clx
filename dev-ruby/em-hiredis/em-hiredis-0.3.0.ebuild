# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Eventmachine redis client using hiredis native parser"
HOMEPAGE="http://github.com/mloughran/em-hiredis"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0"
ruby_add_rdepend ">=dev-ruby/hiredis-0.5.0"
ruby_add_rdepend ">=dev-ruby/em-spec-0.2.5"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

