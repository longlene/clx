# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Brief is a library for developing applications whose primary interface is the text editor"
HOMEPAGE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "<dev-ruby/hashie-3.0"
ruby_add_rdepend ">=dev-ruby/commander-4.2.1"
ruby_add_rdepend ">=dev-ruby/github-fs-0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0.3"
ruby_add_rdepend ">=dev-ruby/inflecto-0"
ruby_add_rdepend ">=dev-ruby/activemodel-0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.0"
ruby_add_rdepend "=dev-ruby/nokogiri-1.6.5"
ruby_add_rdepend ">=dev-ruby/github-markdown-0.6.8"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/pry-nav-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/octokit-0"

