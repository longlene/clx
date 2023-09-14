# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A unix tool to execute javascript on a headless browser"
HOMEPAGE="https://github.com/sotownsend/BooJS"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/pry-0.1"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
#ruby_add_rdepend ">=dev-ruby/webrick-1.3"
ruby_add_rdepend ">=dev-ruby/therubyracer-0.12"
ruby_add_rdepend ">=dev-ruby/phantomjs-1.9"
ruby_add_rdepend ">=dev-ruby/greenletters-0.3"

