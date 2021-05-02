# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Brief is a library for developing applications whose primary interface is the text editor"
HOMEPAGE="https://architects.io/brief"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hashie-3.0.4"
ruby_add_rdepend ">=dev-ruby/commander-4.3"
ruby_add_rdepend ">=dev-ruby/terminal-table-0"
ruby_add_rdepend ">=dev-ruby/github-fs-0"
ruby_add_rdepend ">=dev-ruby/virtus-1.0"
ruby_add_rdepend ">=dev-ruby/inflecto-0"
ruby_add_rdepend ">dev-ruby/activesupport-3.2"
ruby_add_rdepend ">=dev-ruby/hike-1.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend "=dev-ruby/github-markdown-0.6.8"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0"
ruby_add_rdepend ">=dev-ruby/em-websocket-0.5"
ruby_add_rdepend "=dev-ruby/thin-1.6.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/git-version-bump-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/byebug-5.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/octokit-3.0"

